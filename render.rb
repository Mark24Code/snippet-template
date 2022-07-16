require 'erb'

module SnippetCommon
  def write_result(output,content)
    File.open("#{output}", 'w') { |f|
      f << content
    }
  end

  # 思路2 使用类对象加载，这个更好可以减少重复加载
  # 利用ruby语言特效
  def require_template(name)
    require_relative "./snippet/#{name.to_s}.rb"
  end

end

class Snippet
  include SnippetCommon

  def initialize(name)
    @name = name
  end

  def get_binding
    binding
  end

  def result
    require_template(@name)
    targetKls = Object.const_get("SnippetTemplate::#{@name.capitalize}")
    template = targetKls.new.view

    return ERB.new(template).result(self.get_binding)
  end

  def render(name)
    self.class.new(name).result
  end
end

# 外部render 和 内部render 保持一致
# 第一次运行的是外部render，一旦开始是内部class绑定的render，达到概念的一致性
# name 是约定的 sinippet 中文件名 symbol
# 文件名小写、内部template存在约定

# 约定module范式、接口view
#
# module SnippetTemplate
#   class Title
#     def view
#     return %{
#       >>>> title <<<<
#     }
#     end
#   end
# end
def render(name)
  Snippet.new(name).result
end
