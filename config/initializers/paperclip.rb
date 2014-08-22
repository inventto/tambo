if Rails.env.production?
  Paperclip::Attachment.default_options[:url] ='emporiotambo.herokuapp.com' 
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
  Paperclip::Attachment.default_options[:s3_host_name] = 's3-sa-east-1.amazonaws.com'
  Paperclip.interpolates(:s3_sg_url) do |att, style| 
    "#{att.s3_protocol}://#{Paperclip::Attachment.default_options[:s3_host_name]}/#{att.bucket_name}/#{att.path(style)}"
  end
end

DEFAULT_OPTS_FOR_PAPPER_CLIP = { 
  styles: {
    big:      "1000x1000",
    default:  "500x500",
    thumb:    "256x256",
    small_thumb: "128x128" 
  },
 default_url: "/images/:style/missing.png"
}
