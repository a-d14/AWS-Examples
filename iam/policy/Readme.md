The command
```sh
yq -o json policy.yml > policy.json
```

The bash script
```sh
./update
```

# Create IAM Policy

```sh
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json
```

# Attach Policy to user

```sh
aws iam attach-user-policy \
    --policy-arn arn:aws:iam::975050097878:policy/my-fun-policy \
    --user-name aws-examples
```

# Deleting Policies

```sh
aws iam delete-policy-version \
    --policy-arn arn:aws:iam::975050097878:policy/my-fun-policy \
    --version-id v1
```