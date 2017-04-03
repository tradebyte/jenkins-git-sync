# Contributing

We love contributions from everyone.
By participating in this project,
you agree to abide by the thoughtbot [code of conduct].

  [code of conduct]: code-of-conduct.md

We expect everyone to follow the code of conduct
anywhere in thoughtbot's project codebases,
issue trackers, chatrooms, and mailing lists.

## Contributing Code

Fork the repo.

Follow the guide, use the Linter and Beautifier:

* Guide: [bashstyle][bashstyle]
* Linter: [shellcheck][shellcheck]
* Beautifier: [beautysh][beautysh]

    [bashstyle]: https://github.com/progrium/bashstyle
    [shellcheck]: https://github.com/koalaman/shellcheck
    [beautysh]: https://github.com/bemeurer/beautysh

It should pass:
```bash
$ shellcheck scripts/*
$ beautysh -f scripts/*
```

Mention how your changes affect the project to other developers and users in the
`NEWS.md` file.

Push to your fork. Write a [good commit message][commit]. Submit a pull request.

  [commit]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

Others will give constructive feedback.
This is a time for discussion and improvements,
and making the necessary changes will be required before we can
merge the contribution.