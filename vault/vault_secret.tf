resource "vault_generic_secret" "dev-01" {
  path      = "secret/example/dev-01"
  data_json = <<EOT
  {
    "MYSQL_PASSWORD": "mysql-dev-01",
    "MYSQL_USER": "root-dev-01",
    "REDIS_PASSWORD": "redis-dev-01"
  }
  EOT
}

resource "vault_generic_secret" "stg-01" {
  path      = "secret/example/stg-01"
  data_json = <<EOT
  {
    "MYSQL_PASSWORD": "mysql-stg-01",
    "MYSQL_USER": "root-stg-01",
    "REDIS_PASSWORD": "redis-stg-01"
  }
  EOT
}

resource "vault_generic_secret" "shared" {
  path      = "secret/shared"
  data_json = <<EOT
  {
    "GOOGLE_CREDENTIALS": "{\n  \"type\": \"service_account\",\n  \"project_id\": \"vault-injector\",\n  \"private_key_id\": \"c6e1a872ab12e2ef2f44162aad0b35f6cc26e43f\",\n  \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCwjOsgvry4FpwG\\nbSnMLZpfZ5r9Lm3DtQ+Y0OuQniUz3k2BwP42HmS7DNUfvE0KK2NfbiRecXgozwTW\\n6Zoy3kGWPDBpztpj6AQ5jxMwe1qoP8EzAMceRPaj+V2W1U+us2KLkRKx9LTrWom4\\nhqmLpd1ciCLv8XeV+jk6VxzM4DxkDVhtBiuqYIi0iRcxo6pnVNjxd9NRVV8yPEcy\\n8GrCjNBU6rAZsAEYOSSevVO8HqZJ3rtqFFN1llklbf8yG8vSuJKsAKO7YNltFHQE\\npCuUxzDZUiDIANelWbQ7Oxp2jFfgSxYjactl6oMdhtluoCaQEIPgonYQZawEOQ5d\\n9Z8ESbvLAgMBAAECggEAANyvSTmlMkDqAh4GVjjiyBR5bUMMxifcK6LZg5tCEz7C\\noh+PHjSHyWIGqGEC/0m28oBXLR7gt1JLc8EwP49WQqWIlvurlVFMs/s+3L29c5Tc\\nHKOkVUGA8swE6Pehq/i0Qnoy3SuUtpF6mqwNp+Dnc8w2X3WOX+0Y2nASc+2kXdiw\\nvfnUiJNopGnpY3lpg67aYboQV0AbknEbwjbtmnOiYlpg7aYY7vANZA2TDcvBBqfA\\nwrHA8oY4UW2SlzUcl1HcWT3vdiqHbQh6jEeQmnomXftdp4VMSTKnq+PbMYhFD38j\\nI132D082jK1QgGm0T4DoF71tGIo6wv4wL1lduoPAAQKBgQDxr7DJuhOzNoGX94PS\\nhBurkW420upAJrTpG/S8D3ZyedUSg4flDqiVQ+HEZOSInF9WlaS1QDN/Lq787v2q\\nE6XUogcmIvwH7K+FEdwgGmTTWsmPTT/Q+rhDROm4Tz2fzYiVJxl3ODesqNntVm87\\nPk+yLSY2hSlh7A30/0lOsAFVgQKBgQC7Aaz5nSV1omLa6xVzz7q5thTB16jdAWJo\\nOzvT/uWyqnlj9u+kzy0Y3uKspPsO80ZC3zmBL6b6PtVk1o5LAE/Owb9T6gBYQHh3\\n8RdWpPtKMFjb+GRheEclU37qpIlx3DOYlQjJj+FZvmJhHNOKWmEkYkUt+JM/hDVb\\nVwhAbLMvSwKBgCa5tQUNuLxdfnRgJ5IisuBRxCwqrXgr+47ieNttStha5yY5RxwP\\ntjl8j/9M/0VYcPpJrgOQzu+RBl7m2GRZE5g3ghe9QU7vwMv8qZ3HPOKUyHkasqAE\\nnGPC9gQfRkuFvl3PzwfITTtwLsMVt2rxuAlfrKDNw2y6Sx43jYJ7NyuBAoGABWVX\\n+1/Ya9uCpLRxywSsa51gXfN+ENpwX3eOE2DgedZHaGYApi3ALF6KBddA0z6bwWQ1\\ngY/BbqkPeThjpLBenSWkAqTW27UIhNV1Ce/6vDpG5hn1s4ZH70DIgba7rIhhCL8M\\nINzA8Nj4d7rgM7bF5MndGyV4AjYrX/ZT65/3T58CgYEAqDtb8cAgDAXzcX4zArd8\\n/0FioGiPiobxFYEZuT4MO1COWbyG24WRiZwssqKYAfneDyrz3JqN88F6UIoKzrh+\\nO77AgySV+n79vUbnVxFKRaokfqr1FrnlqdfznpE2zDgfeIMyAiA9WU87TnyHwB70\\n5zP3bIGXahwAdyJ4I0WiKMc=\\n-----END PRIVATE KEY-----\\n\",\n  \"client_email\": \"hashicorp@vault-injector.iam.gserviceaccount.com\",\n  \"client_id\": \"117177686643343372427\",\n  \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",\n  \"token_uri\": \"https://oauth2.googleapis.com/token\",\n  \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",\n  \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/hashicorp%40vault-injector.iam.gserviceaccount.com\"\n}"
  }
  EOT
}
