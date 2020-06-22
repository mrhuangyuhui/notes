<!-- #mocha-debug -->
<!-- omit in toc -->
# Mocha Debugging

- [VSCode](#vscode)

## VSCode

<!-- #node-debug #vscode-debug  -->
[Debugging tests in VS Code](https://github.com/microsoft/vscode-recipes/tree/master/debugging-mocha-tests)

[`.vscode/launch.json`](https://github.com/microsoft/vscode-recipes/blob/master/debugging-mocha-tests/.vscode/launch.json)

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "node",
            "request": "launch",
            "name": "Mocha All with Options",
            "program": "${workspaceFolder}/node_modules/mocha/bin/_mocha",
            "args": [
                "--opts", 
                "${workspaceFolder}/support/mocha.opts",
                "${workspaceFolder}/test"
            ],
            "console": "integratedTerminal",
            "internalConsoleOptions": "neverOpen"
        },
        {
            "type": "node",
            "request": "launch",
            "name": "Mocha All",
            "program": "${workspaceFolder}/node_modules/mocha/bin/_mocha",
            "args": [
                "--timeout",
                "999999",
                "--colors",
                "${workspaceFolder}/test"
            ],
            "console": "integratedTerminal",
            "internalConsoleOptions": "neverOpen"
        },
        {
            "type": "node",
            "request": "launch",
            "name": "Mocha Current File",
            "program": "${workspaceFolder}/node_modules/mocha/bin/_mocha",
            "args": [
                "--timeout",
                "999999",
                "--colors",
                "${file}"
            ],
            "console": "integratedTerminal",
            "internalConsoleOptions": "neverOpen"
        }
    ]
}
```
