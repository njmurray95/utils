# pip install gitpython
import git

def swap_to_master():
    repo = git.Repo(search_parent_directories=True)
    
    current = repo.head.ref
    master = repo.heads.master
    
    # NOTE:
    # THIS WILL SWITCH BRANCHES WITHOUT CONFIRMING BEFORE DESTROYING UNSAVED WORK
    r.head.reference = master
    repo.head.reset(index=True, working_tree=True)
