module RequiredParams
  extend ActiveSupport::Concern

  included do

    # method will allow users to check params in Controllers for required parameters
    # it can also check for parameters where one or the other are required
    # usage:
    # for required parameters, send each in an Array
    # -> ensure_required_params([:param_one, :param_two])
    # for one or the other parameters, enclose them in a nested Array
    # -> ensure_required_params([[:one_param, :other_param], :param_one, :param_two])
    def ensure_required_params(required_params)
      required_params.delete_if { |p| params.key?(p) || p.is_a?(Array) && p.any? { |k| params.key?(k) } }
    end
  end
end
