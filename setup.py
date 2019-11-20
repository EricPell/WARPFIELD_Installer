import sys
import os
import yaml
import numpy

def load_meta():
    meta_dict = yaml.load(open("meta_db.yaml", Loader=yaml.FullLoader))
    return(meta_dict)


def setup_ENV(meta_dict, packages_to_install):
    variables_to_set = local_depends = numpy.array([],dtype="<U1")

    for package in packages_to_install:
        variables_to_set = numpy.unique(numpy.append(variables_to_set, meta_dict[package]["warpfield_environ_variables"]))

    bashrc_path = os.getenv("HOME")+"/.bashrc"
    open file for writing.

    for variable in variables_to_set:
        if variable is not in os.getenv

def get_depends(meta_dict,packages_to_install):
    local_depends = numpy.array([],dtype="<U1")
    
    for package in packages_to_install:
        local_depends = numpy.unique(numpy.append(local_depends, meta_dict[package]["dependencies"]))
    
    while len(numpy.unique(numpy.append(packages_to_install, local_depends))) > len(packages_to_install):
        packages_to_install = numpy.unique(numpy.append(packages_to_install, local_depends))

        for package in packages_to_install:
            local_depends = numpy.unique(numpy.append(local_depends, meta_dict[package]["dependencies"]))
    
    return(packages_to_install)


if __name__ == "__main__":
    meta_dict = load_meta()
    packages_to_install = ["WARPFIELD_EMP_VIEWER"]  