class InvoiceJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "================ hello #{args} =================="
  end
end
