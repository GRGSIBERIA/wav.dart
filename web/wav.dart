import 'dart:html';

import 'dart:typed_data';

enum WavFormat { WAVE, OTHER }
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

  WavFile._({
    this.chunkID,
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

  static Future<WavFile> open({File file}) async {
    String chunkID;
    int chunkSize;
    WavFormat format;
    String rawFormat;
    String subChunk1ID;
    int subChunk1Size;
    int rawEncoding;
    Encoding encoding;
    int numChannels;
    int sampleRate;
    int blockAlign;
    int bitsPerSample;
    String subChunk2ID;
    int subChunk2Size;
    double bytesPerSample;
    int sampleCount;
    double audioLength;
    Surround surround;

    var reader = FileReader();

    reader.readAsText(file.slice(0, 4));
    chunkID = reader.result;

    reader.readAsArrayBuffer(file.slice(4, 8));
    chunkSize = Int32List.view(reader.result)[0];

    reader.readAsText(file.slice(8, 12));
    final String formatStr = reader.result;
    format = getFormat(formatStr);

  }
  static WavFormat getFormat(String formatStr) {
    switch (formatStr) {
      case 'WAVE':
        return WavFormat.WAVE;
        break;
      default:
        return WavFormat.OTHER;
    }
  }

  static Encoding getEncoding(int encodingInt) {
    switch (encodingInt) {
      case 1:
        return Encoding.PCM;
        break;
      default:
        return Encoding.OTHER;
    }
  }

  static Surround getSystem(int numChannels) {
    switch (numChannels) {
      case 1:
        return Surround.MONO;
        break;
      case 2:
        return Surround.STEREO;
        break;
      default:
        return Surround.MONO;
    }
  }
}
