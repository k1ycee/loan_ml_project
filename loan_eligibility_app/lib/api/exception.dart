class RequestException {
  final String message;
  final StackTrace? trace;

  const RequestException({required this.message, this.trace});

  @override
  String toString() => "DownloaderException(message: $message)";
}

// class DownloadCancelException extends RequestException {
//   DownloadCancelException({super.message = "Download cancelled", super.trace});
// }

// class DownloadPauseException extends RequestException {
//   DownloadPauseException({super.message = "Download paused", super.trace});
// }