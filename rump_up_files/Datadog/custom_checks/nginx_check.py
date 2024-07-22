import requests
from datadog_checks.base import AgentCheck

class NginxCheck(AgentCheck):
    def check(self, instance):
        url = instance.get('nginx_status_url')
        if not url:
            self.log.error('No URL specified for Nginx status check')
            return

        try:
            response = requests.get(url)
            response.raise_for_status()
            self.service_check('nginx.status', self.OK)
        except requests.exceptions.RequestException as e:
            self.log.error('Failed to fetch Nginx status: %s', e)
            self.service_check('nginx.status', self.CRITICAL, message=str(e))
            
        # Checking the availability of the main page
        page_url = instance.get('nginx_page_url')
        if not page_url:
            self.log.error('No URL specified for Nginx page check')
            return

        try:
            response = requests.get(page_url)
            response.raise_for_status()
            self.gauge('nginx.page_status_code', response.status_code)
            self.service_check('nginx.page_status', self.OK)
        except requests.exceptions.RequestException as e:
            self.log.error('Failed to fetch Nginx page: %s', e)
            self.service_check('nginx.page_status', self.CRITICAL, message=str(e))

