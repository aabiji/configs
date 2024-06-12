import os

files = os.listdir(os.getcwd())
for file in files:
    if ".sh" in file or ".py" in file:
        continue
    dst = f"/home/aabiji/{file}"
    src = f"/home/aabiji/dev/configs/{file}"
    os.symlink(src, dst)
