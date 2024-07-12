import os

path = f"{os.getcwd()}/dotfiles"
entries = os.listdir(path)
for entry in entries:
    if ".sh" in entry or ".py" in entry:
        continue
    dst = f"/home/aabiji/{entry}"
    src = f"{path}/{entry}"
    os.symlink(src, dst)
