%% Test Class Definition
classdef NormalizationUnitTests < matlab.unittest.TestCase
    
    % -------------------------------------------------------------------
    % Copyright (c) 2019 Shapelets.io
    %
    % This Source Code Form is subject to the terms of the Mozilla Public
    % License, v. 2.0. If a copy of the MPL was not distributed with this
    % file, You can obtain one at http://mozilla.org/MPL/2.0/.
    % -------------------------------------------------------------------
    
    properties
        delta
    end
    
    methods (TestClassSetup)
        function addLibraryClassToPath(testCase)
            p = path;
            testCase.addTeardown(@path,p);
            addpath ..;
            testCase.delta = 1e-6;
        end
    end
    
    %% Test Method Block
    methods (Test)
        function testDecimalScalingNorm(testCase)
           a = khiva.Array(single([[0, 1, -2, 3]', [40, 50, 60, -70]']));
           b = khiva.Normalization.decimalScalingNorm(a);
           expected = single([[0.0, 0.1, -0.2, 0.3]', [0.4, 0.5, 0.6, -0.7]']);
           c = b.getData();
           diff = abs(c - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testDecimalScalingNormInPlace(testCase)
           a = khiva.Array(single([[0, 1, -2, 3]', [40, 50, 60, -70]']));
           khiva.Normalization.decimalScalingNormInPlace(a);
           expected = single([[0.0, 0.1, -0.2, 0.3]', [0.4, 0.5, 0.6, -0.7]']);
           b = a.getData();
           diff = abs(b - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testMaxMinNorm(testCase)
           a = khiva.Array(single([[0, 1, 2, 3]', [4, 5, 6, 7]']));
           b = khiva.Normalization.maxMinNorm(a, 2.0, 1.0, 1e-8);
           expected = single([[1.0, 1.3333333333333, 1.66666667, 2.0]', ...
               [1.0, 1.3333333333333, 1.66666667, 2.0]']);
           c = b.getData();
           diff = abs(c - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testMaxMinNormInPlace(testCase)
           a = khiva.Array(single([[0, 1, 2, 3]', [4, 5, 6, 7]']));
           khiva.Normalization.maxMinNormInPlace(a, 2.0, 1.0, 1e-8);
           expected = single([[1.0, 1.3333333333333, 1.66666667, 2.0]', ...
               [1.0, 1.3333333333333, 1.66666667, 2.0]']);
           b = a.getData();
           diff = abs(b - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testMeanNorm(testCase)
           a = khiva.Array(single([[0, 1, 2, 3]', [4, 5, 6, 7]']));
           b = khiva.Normalization.meanNorm(a);
           expected = single([[-0.5, -0.166666667, 0.166666667, 0.5]', ... 
               [-0.5, -0.166666667, 0.166666667, 0.5]']);
           c = b.getData();
           diff = abs(c - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testMeanNormInPlace(testCase)
           a = khiva.Array(single([[0, 1, 2, 3]', [4, 5, 6, 7]']));
           khiva.Normalization.meanNormInPlace(a);
           expected = single([[-0.5, -0.166666667, 0.166666667, 0.5]', ...
               [-0.5, -0.166666667, 0.166666667, 0.5]']);
           b = a.getData();
           diff = abs(b - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testZNorm(testCase)
           a = khiva.Array(single([[0, 1, 2, 3]', [4, 5, 6, 7]']));
           b = khiva.Normalization.zNorm(a, 1e-8);
           expected = single([[-1.341640786499870, -0.447213595499958, ...
               0.447213595499958, 1.341640786499870]', [-1.341640786499870, ...
               -0.447213595499958, 0.447213595499958, 1.341640786499870]']);
           c = b.getData();
           diff = abs(c - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
        
        function testZNormInPlace(testCase)
           a = khiva.Array(single([[0, 1, 2, 3]', [4, 5, 6, 7]']));
           khiva.Normalization.zNormInPlace(a, 1e-8);
           expected = single([[-1.341640786499870, -0.447213595499958, ...
               0.447213595499958, 1.341640786499870]', [-1.341640786499870, ...
               -0.447213595499958, 0.447213595499958, 1.341640786499870]']);
           b = a.getData();
           diff = abs(b - expected);
           testCase.verifyLessThanOrEqual(diff, testCase.delta);
        end
    end
end
