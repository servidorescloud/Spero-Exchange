module Private::Withdraws
  class MxtsController < ::Private::Withdraws::BaseController
    include ::Withdraws::Withdrawable
  end
end
