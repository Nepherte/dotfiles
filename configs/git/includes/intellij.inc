[merge]
tool = idea

[mergetool "idea"]
cmd = idea merge $LOCAL $REMOTE $BASE $MERGED
trustExitCode = true