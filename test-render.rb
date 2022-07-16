require './render'

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

# 最终寻找文件会转成字符串，所以这里是字符串也没关系
puts render({name: 'nick', props: { card_id: "1234" }})