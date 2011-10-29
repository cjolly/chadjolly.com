class PagesController < ApplicationController
  def home

  end

  def packers
    @page_title = "My Packers Season Tickets Story | Chad Jolly"
    @meta_description = "I've been on the Packers season ticket waiting list for 30 years. This is my story."

    @data_points = {
      'Chad' => [
        [2003, 714],
        [2004, 673],
        [2005, 656],
        [2006, 629],
        [2007, 607],
        [2008, 591],
        [2009, 544],
        [2010, 480],
        [2011, 448]
      ],

      'Emily' => [
        [2003, 2652],
        [2004, 2589],
        [2005, 2552],
        [2006, 2497],
        [2007, 2443],
        [2008, 2357],
        [2009, 2217],
        [2010, 2081],
        [2011, 2000]
      ],

      'Amy' => [
        [2003, 2653],
        [2004, 2590],
        [2005, 2553],
        [2006, 2498],
        [2007, 2444],
        [2008, 2358],
        [2009, 2218],
        [2010, 2082],
        [2011, 2001]
      ]
    }
  end
end
