import logging
import subprocess

logger = logging.getLogger(__name__)

def extract_resource(resource_name: str = None, descriptor: str = 'datapackage.yaml'):
    subprocess.run(['Rscript', 'scripts/extract.R'], check=True)
