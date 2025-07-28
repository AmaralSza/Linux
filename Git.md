================================================================================

### REMOVER HISTORICO DO ARQUIVO NO GIT

```
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch Caminho/do/Arquivo.x' --prune-empty --tag-name-filter cat -- --all
```

```
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
git push origin --force --all
git push origin --force --tags
```
