import os

FOLDER_NAME = 'template-test'

def test_portlet_folder_was_created():
    assert(os.path.exists(FOLDER_NAME))

def test_portlet_folder_is_folder():
    assert(os.path.isdir(FOLDER_NAME))