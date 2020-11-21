return if Bundler::Dsl.instance_methods.include?(:component)

require_relative "./eval_gemfile"

class Bundler::Dsl
  def component(name, namespace: "engines")
    Dir.chdir(__dir__) do
      component_group = name.to_sym
      group :default, component_group do
        gem name, path: "#{namespace}/#{name}"

        if File.readable?("#{namespace}/#{name}/Gemfile.runtime")
          eval_gemfile "#{namespace}/#{name}/Gemfile.runtime"
        end
      end

      group component_group do
        expanded_spec_path = Pathname.new("#{namespace}/#{name}/#{name}.gemspec").expand_path(@gemfile&.parent)

        spec = Gem::Specification.load(expanded_spec_path.to_s)

        spec.dependencies.select { |s| s.type == :development }.each do |dep|
          current = @dependencies.find { |current_dep| current_dep.name == dep.name }

          if current
            next if current.source.is_a?(Bundler::Source::Path)
          end

          gem dep.name, *dep.requirement.to_s.split(/,\s*/)
        end
      end
    end
  end
end