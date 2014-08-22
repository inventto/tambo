if Rails.env.production?
  Paperclip::Attachment.default_options[:url] ='emporiotambo.herokuapp.com' 
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  Paperclip::Attachment.default_options[:s3_host_name] = 's3-sa-east-1.amazonaws.com'
  Paperclip.interpolates(:s3_sg_url) do |att, style| 
    "#{att.s3_protocol}://#{Paperclip::Attachment.default_options[:s3_host_name]}/#{att.bucket_name}/#{att.path(style)}"
  end
end
