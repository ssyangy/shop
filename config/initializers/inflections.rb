# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
# ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end
Paperclip::Attachment.class_eval("def base_url;instance.base_url;end")
Paperclip::Interpolations.class_eval("def base_url(attachment,style_name);attachment.instance.base_url;end")