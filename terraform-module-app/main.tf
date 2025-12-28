module "dev-infra"{
    source="./infra_app"
    env="dev"
    bucket_name="dev-infra-app-bucket-12345"
    ami_id="ami-0ecb62995f68bb549"
    instance_count=1
    storage_size=10
    instance_type="t3.micro"
    hash_key="StudentLockID"
}
# module "prd-infra"{
#     source="./infra_app"
#     env="prd"
#     bucket_name="prd-infra-app-bucket-12345"
#     ami_id="ami-0ecb62995f68bb549"
#     instance_count=2
#     storage_size=15
#     instance_type="t3.micro"
#     hash_key="LockID"
# }
# module "staging-infra"{
#     source="./infra_app"
#     env="stg"
#     bucket_name="prd-infra-app-bucket-12345"
#     ami_id="ami-0ecb62995f68bb549"
#     instance_count=2
#     storage_size=15
#     instance_type="t3.micro"
#     hash_key="LockID"
# }
