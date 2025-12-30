{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "sanisoclem";
        email = "mel@busstop.dev";
      };
      push.default = "simple";
      alias = {
        tree = "log --oneline --decorate --all --graph";
        acm = "!git add . && git commit -m";
        ac = "!git add . && git commit";
        acf = "!git add . && git commit --fixup HEAD";
        ds = "diff --stat";
        dc = "diff --cached";
        dcs = "diff --stat --cached";
        s = "status -s";
        co = "checkout";
        cob = "checkout -b";
        com = "checkout origin/master";
        com2 = "checkout origin/main";
        puush = "push -u origin HEAD";
        pf = "push -f";
        poof = "push -f";
        rst = "reset HEAD --hard";
        rbmi = "rebase origin/master -i --autosquash";
        rbmi2 = "rebase origin/main -i --autosquash";
        cleanup = "!git fetch --prune -v && git co master && git merge origin/master --ff-only && git branch --merged | grep -v '\\*' > /tmp/merged && vi /tmp/merged && xargs git branch -d < /tmp/merged";
        cleanup2 = "!git fetch --prune -v && git co main && git merge origin/main --ff-only && git branch --merged | grep -v '\\*' > /tmp/merged-main && vi /tmp/merged-main && xargs git branch -d < /tmp/merged-main";
      };
    };
  };
}
