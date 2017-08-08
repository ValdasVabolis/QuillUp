module WaitUntil
  def then_wait_for_page_change(&block)
    old = current_path
    block.call
    wait_until { current_path != old }
  end

  def wait_until(&block)
    Timeout.timeout(Capybara.default_max_wait_time) do
      loop until block.call
    end
  end



  def then_wait_for_ajax(&block)
    block.call
    wait_for_ajax
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_max_wait_time) do
      sleep(1)
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end
