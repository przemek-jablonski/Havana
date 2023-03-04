public enum NetworkServiceError: Error {
case privateAccessTokenFetchingFailed(Error)
case networkRequestFailed(Error)
}
