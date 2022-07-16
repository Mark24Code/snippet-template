module StringPatch
  refine String do
    def snake_case
        # Convert camelCase/PascalCase to snake_case. 
        return downcase if match(/\A[A-Z]+\z/)
        gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z])([A-Z])/, '\1_\2')
        .downcase
    end

    def camel_case
      return self.split("_").map {|i| i.capitalize}.join
    end
  end
end

using StringPatch

puts "A_B_C".snake_case

puts "AttBttCtt".camel_case