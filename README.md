# Kyso push action

Action that pushes the contents of a repository to a Kyso instance using the
[kyso/kyso](https://hub.docker.com/r/kyso/kyso) container image.

## Inputs

## `username`

**Required** The kyso user to use. No default. CAN be defined as a secret.

## `token`

**Required** Token for the kyso user. No default. MUST be defined as a secret.

## `url`

**Required** The kyso instance URL. Default `https://kyso.io/`.

## Outputs

None right now.

## Example usage

An example workflow using this action:

```yaml
name: 'Push To Kyso'
  on:
    push:
      branches:
        - 'main'
      tags:
        - 'v*'
  jobs:
    push-to-kyso:
      runs-on: ubuntu-latest
      name: Job to push a report to kyso
      steps:
        - name: Clone repo step
          uses: actions/checkout@v3
        - name: Kyso push step
          id: kyso-push
          uses: kyso-io/push-action@v1
          with:
            username: ${{ secrets.KYSO_USERNAME }}
            token: ${{ secrets.KYSO_TOKEN }}
            url: 'https://kyso.io/'
```

### Notes

- The example runs on `push` events on the `main` branch and on `tags` that
  match the pattern `v*`, but maybe is better to push to kyso only on `tags`.

- As the action expects the report in the current directory we have to checkout
  the directory first.

- The `secrets` have to be defined on the project using this workflow (go to
  the project `settings/secrets/actions` page to set them).

- If we are pushing to `https://kyso.io/` the `url` argument can be left out.

- To avoid pushing all the files remember to add a `.kysoingore` file with at
  least the following content (`.git` and `.kysoignore` are ignored by default):
  ```
  .github
  ```


## License

The scripts and documentation in this project are released under the [MIT
License](https://github.com/kyso-io/push-action/blob/main/LICENSE).
