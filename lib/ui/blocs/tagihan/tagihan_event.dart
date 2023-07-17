part of 'tagihan_bloc.dart';

abstract class TagihanEvent extends Equatable {
  const TagihanEvent();

  @override
  List<Object> get props => [];
}

class TagihanGetLatest extends TagihanEvent {
  final int permanaHomeNumberId;
  const TagihanGetLatest(this.permanaHomeNumberId);

  @override
  List<Object> get props => [permanaHomeNumberId];
}

class TagihanGet extends TagihanEvent {
  final int userId;
  const TagihanGet(this.userId);

  @override
  List<Object> get props => [userId];
}
