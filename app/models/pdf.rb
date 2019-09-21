class Pdf < ApplicationRecord
  mount_uploaders :pdf, PdfUploader
  serialize :avatars, JSON
end
