class NormSerializer < ActiveModel::Serializer

  attributes :id, :value, :interval, :level

  belongs_to :subject, serializer: SubjectPreviewSerializer
  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'

end
