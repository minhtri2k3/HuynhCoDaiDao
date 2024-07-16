// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_album_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AudioAlbumPage _$AudioAlbumPageFromJson(Map<String, dynamic> json) =>
    AudioAlbumPage(
      currentPage: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      path: json['path'] as String,
      firstPageUrl: json['first_page_url'] as String,
      lastPageUrl: json['last_page_url'] as String,
      prevPageUrl: json['prev_page_url'] as String,
      nextPageUrl: json['next_page_url'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => AudioAlbumItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AudioAlbumPageToJson(AudioAlbumPage instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'from': instance.from,
      'to': instance.to,
      'path': instance.path,
      'first_page_url': instance.firstPageUrl,
      'last_page_url': instance.lastPageUrl,
      'prev_page_url': instance.prevPageUrl,
      'next_page_url': instance.nextPageUrl,
      'data': instance.data,
    };
