classdef TestCompareVersions < matlab.unittest.TestCase
    % TestCompareVersions performs unit tests for compareVersions use.
    methods (Test)
        function testSimple(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0]));
        end
        function testMult(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1]));
        end
        function testLong(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1','5.42.12.3'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0]));
        end
        function testString(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1','5.42.12.3','12.dev4'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1]));
        end
        function testNoPeriod(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1','5.42.12.3','12.dev4','10'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1]));
        end
        function testEqual(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1','5.42.12.3','12.dev4','10','8.0.0'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 1]));
        end
        function testEqualString(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1','5.42.12.3','12.dev4','10','8.0test.0'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 1]));
        end
        function testEqualLong(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'3.2.4','9.2.1','5.42.12.3','12.dev4','10','8.0.tmp0.0.0'};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 1]));
        end
        function testDoubleQuote(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {"3.2.4","9.2.1","5.42.12.3","12.dev4","10","8.0.tmp0.0.0"};
            v = '8.0.0';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 1]));
        end
        function testVerNoPeriod(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {"3.2.4","9.2.1","5.42.12.3","12.dev4","10","8.0.tmp0.0.0"};
            v = '8';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 1]));
        end
        function testVerString(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {"3.2.4","9.2.1","5.42.12.3","12.dev4","10","8.0.tmp0.0.0"};
            v = '8beta';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 1]));
        end
        function testVerLong(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {"3.2.4","9.2.1","5.42.12.3","12.dev4","10","8.0.tmp0.0.0"};
            v = '8beta.1.2.3.4.5.6';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 0]));
        end
        function testVerDoubleQuote(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {"3.2.4","9.2.1","5.42.12.3","12.dev4","10","8.0.tmp0.0.0"};
            v = "8beta.1.2.3.4.5.6";

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([0 1 0 1 1 0]));
        end
        function testCellEmpty(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {};
            v = "8beta.1.2.3.4.5.6";

            testCase.verifyError(@() compareVersions(v_cell, v), ...
                'compareVersions:Error:CellArray');
        end
        function testValueEmpty(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'4.3.3',''};
            v = '8.0.0';

            testCase.verifyError(@() compareVersions(v_cell, v), ...
                'compareVersions:Error:CellArray');
        end
        function testValueNotString(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'4.3.3',8};
            v = '8.0.0';

            testCase.verifyError(@() compareVersions(v_cell, v), ...
                'compareVersions:Error:CellArray');
        end
        function testVerNotString(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'4.3.3','9.2'};
            v = 8;

            testCase.verifyError(@() compareVersions(v_cell, v), ...
                'compareVersions:Error:VersionRef');
        end
        function testVerEmpty(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {'4.3.3','9.2'};
            v = '';

            testCase.verifyError(@() compareVersions(v_cell, v), ...
                'compareVersions:Error:VersionRef');
        end
        function testDoublePeriod(testCase)
            st = dbstack;
            disp(['---------------' st(1).name '---------------']);
            v_cell = {"9.2..4"};
            v = '8beta.1.2.3.4.5.6';

            testCase.verifyEqual(...
                compareVersions(v_cell, v), logical([1]));
        end
    end
end