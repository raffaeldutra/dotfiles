# Functions list for GPG

```
$ cat ${HOME}/.functions/* | grep -E '(^# [a-z A-Z]|[()] {)' | sed "s|[{]||g;/^$/d;s/^# /\n/g;s/^[a-z].*/\**&\**/;s|() \**|()\**|g"
```

Generate a new key and print it on terminal

```gpg_generate_key()```

List all keys founded

```gpg_list_keys()```

Delete a key using the ID

```gpg_delete_key_by_id ()```

Export a key using the ID. It can be used using the function gpg_list_keys to retrieve IDs keys

```gpg_export_by_id()```
