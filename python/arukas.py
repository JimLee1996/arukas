
# Using api of arukas.io to fetch containers informaion
def containers(token, secret):
    from requests import get
    from json import loads

    url = 'https://app.arukas.io/api/containers'
    header = {'Content-Type': 'application/vnd.api+json', 'Accept': 'application/vnd.api+json'}

    try:
        r = get(url, auth=(token, secret), headers=header)
        data_json = r.text
        data = loads(data_json)['data']

    except:
        data = []

    return data

# Reshape data of containers information
def reshape(data):
    containers = []

    for x in data:
        attr = x['attributes']
        app_id = attr['app_id']
        arukas_domain = attr['arukas_domain']
        status_text = attr['status_text']

        try:
            key_info = attr['port_mappings'][0]
            ss_port = kcp_port = 0
            for x in key_info:
                if x['protocol'] == 'tcp':
                    ss_port = x['service_port']
                elif x['protocol'] == 'udp':
                    kcp_port = x['service_port']
                ip = x['host']
        except:
            ss_port = kcp_port = 0
            ip = 'No-IP'

        container = {'app_id':app_id, 'arukas_domain':arukas_domain, 'status_text':status_text, 'ip':ip, 'ss_port':ss_port, 'kcp_port':kcp_port}
        containers.append(container)

    return containers

