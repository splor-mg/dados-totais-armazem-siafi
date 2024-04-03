import logging
import subprocess

logger = logging.getLogger(__name__)

def extract_resource(resource_name: str = None, descriptor: str = 'datapackage.yaml'):
    subprocess.call('Rscript scripts/extract.R', shell=True)
