import "dart:html";

enum WavFormat { WAV, OTHER }
enum Encoding { PCM, OTHER }
enum Surround { STEREO, MONO }

class WavFile {
  final String chunkID;
  final int chunkSize;
  final WavFormat format;
  final String rawFormat;
  final String subChunk1ID;
  final int subChunk1Size;
  final int rawEncoding;
  final Encoding encoding;
  final int numChannels;
  final int sampleRate;
  final int blockAlign;
  final int bitsPerSample;
  final String subChunk2ID;
  final int subChunk2Size;
  final double bytesPerSample;
  final int sampleCount;
  final double audioLength;
  final Surround surround;

  WavFile._(
      {this.chunkID,
      this.chunkSize,
      this.format,
      this.rawFormat,
      this.subChunk1ID,
      this.subChunk1Size,
      this.encoding,
      this.rawEncoding,
      this.numChannels,
      this.surround,
      this.sampleRate,
      this.blockAlign,
      this.bitsPerSample,
      this.subChunk2ID,
      this.subChunk2Size,
      this.bytesPerSample,
      this.sampleCount,
      this.audioLength});
}
