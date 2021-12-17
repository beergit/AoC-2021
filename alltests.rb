#!/usr/bin/ruby

require 'test/unit'
require 'test/unit/testcase'
require 'test/unit/ui/console/testrunner'
require 'test/unit/testsuite'
require 'test/unit/testresult'
require_relative './advent1/tc_advent1'
require_relative './advent2/tc_advent2'
require_relative './advent3/tc_advent3'
require_relative './advent4/tc_advent4'
require_relative './advent5/tc_advent5'
require_relative './advent6/tc_advent6'
require_relative './advent7/tc_advent7'
require_relative './advent8/tc_advent8'
require_relative './advent9/tc_advent9'
require_relative './advent10/tc_advent10'
require_relative './advent11/tc_advent11'
require_relative './advent12/tc_advent12'
require_relative './advent13/tc_advent13'
require_relative './advent14/tc_advent14'
require_relative './advent15/tc_advent15'
require_relative './advent16/tc_advent16'

class TS_Advent_2021
  def self.suite()
    suite = Test::Unit::TestSuite::new
    suite << TestAdvent1.suite
    suite << TestAdvent2.suite
    suite << TestAdvent3.suite
    suite << TestAdvent4.suite
    suite << TestAdvent5.suite
    suite << TestAdvent6.suite
    suite << TestAdvent7.suite
    suite << TestAdvent8.suite
    suite << TestAdvent9.suite
    suite << TestAdvent10.suite
    suite << TestAdvent11.suite
    suite << TestAdvent12.suite
    suite << TestAdvent13.suite
    suite << TestAdvent14.suite
    suite << TestAdvent15.suite
    suite << TestAdvent16.suite
    return suite
  end
end

tr = Test::Unit::TestResult::new

TS_Advent_2021.suite.run(tr) do|result|
  puts(result)
end

