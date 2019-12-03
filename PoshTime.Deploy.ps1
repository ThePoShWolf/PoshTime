Deploy "PoshTime" {
    By PSGalleryModule {
        FromSource "Build\PoshTime"
        WithOptions @{
            ApiKey = ''
        }
    }
}