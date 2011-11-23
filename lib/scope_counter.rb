require 'active_record'
require "scope_counter/version"
require "scope_counter/belongs_to_extention"

module ScopeCounter
  module BelongsToExtension
    module ActiveRecord::Associations::Builder
      class BelongsTo < SingularAssociation #:nodoc:
        private
        alias_method :old_add_counter_cache_callbacks, :add_counter_cache_callbacks
        
        def add_counter_cache_callbacks(reflection)
          if Array === options[:counter_cache]
            name = self.name
            options[:counter_cache].each do |scope|
              cache_column = "#{scope}_count"
              
              method_name = "belongs_to_counter_cache_after_create_for_#{scope}"
              model.redefine_method(method_name) do
                record = send(name)
                record.class.increment_counter(cache_column, record.id) unless record.nil?
              end
              
              in_scope_method = "in_#{scope}?"
              model.redefine_method(in_scope_method) do
                send(:class).send(scope).exists?(send(:id))
              end
            
              model.after_create(method_name, :if => :"#{in_scope_method}")
      
              method_name = "belongs_to_counter_cache_before_destroy_for_#{scope}"
              model.redefine_method(method_name) do
                record = send(name)
                record.class.decrement_counter(cache_column, record.id) unless record.nil?
              end
              model.before_destroy(method_name,:if => :"#{in_scope_method}")
  
              model.send(:module_eval,
                "#{reflection.class_name}.send(:attr_readonly,\"#{cache_column}\".intern) if defined?(#{reflection.class_name}) && #{reflection.class_name}.respond_to?(:attr_readonly)", __FILE__, __LINE__
              )
            end
          else
            old_add_counter_cache_callbacks(reflection)
          end
        end
      end 
    end
  end
end

