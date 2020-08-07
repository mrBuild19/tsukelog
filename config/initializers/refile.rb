require "refile/s3"

if Rails.env.production? # 本番環境の場合はS3へアップロード
	aws = {
	  region: "ap-northeast-1", # リージョン
	  bucket: "tsukelog-s3", # バケット名
	}
	Refile.cache = Refile::S3.new(prefix: "cache", **aws)
	Refile.store = Refile::S3.new(prefix: "store", **aws)
end