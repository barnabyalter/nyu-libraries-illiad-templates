require 'mustache'
class IncludeMeta < Mustache
  
  def meta
    '<meta charset="utf-8" /><meta name="viewport" content="width=device-width; initial-scale=1; maximum-scale=1" />'
  end

end
