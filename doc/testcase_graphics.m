disp('Checking basic Graphic Installation of MatTuGames.'); 
disp('The TuGame vector is specified by:');
%w=[0,0,0,0,0,1/4,1/2,1/4,3/4,0,1,1,1,1,2];
w=[0,0,0,0.54839,0,0,15.67188,0,13.54167,11.55263,0,40.75862,36.47619,32.63158,96.29412];
v=gameToMatlab(w)
disp('The dual Tu-Game vector is specified by:');
dv=dual_game(v);
try
    disp('Plotting the core with imputation set, the Shapley value, pre-nucleolus, and pre-kernel.');
    if isunix || ismac 
       CorePlot(v,'all',1);
    elseif ispc
       disp('Skipping test; not supported!'); 
    end	    
    pause(5);
    disp('Plotting the core without imputation set, the Shapley value, pre-nucleolus, and pre-kernel.');
    if isunix || ismac
      CorePlot(v,'all',0);
    elseif ispc
      disp('Skipping test; not supported!');
    end	     
    pause(5);
    disp('Plotting the core with imputation set using Cddmex, the Shapley value, pre-nucleolus, and pre-kernel.');
    CddCorePlot(v,'all',1);
    pause(5);
    disp('Plotting the core without imputation set using Cddmex, the Shapley value, pre-nucleolus, and pre-kernel.');
    CddCorePlot(v,'all',0); 
    pause(5);    
    disp('Plotting the core without imputation set, and the Shapley value.');
    if isunix || ismac
      CorePlot(v,'shap',0);
    elseif ispc
      disp('Skipping test; not supported!');
    end	     
    pause(5);
    disp('Plotting the core with imputation set using Cddmex, and the Shapley value.');
    CddCorePlot(v,'shap',1);
    pause(5);
    disp('Plotting the core with imputation set using Cddmex, and the pre-kernel.');
    CddCorePlot(v,'prk',1);
    pause(5);
    disp('Plotting the core with imputation set using Cddmex, and the pre-nucleolus.');
    CddCorePlot(v,'prn',1);
    pause(5);
    disp('Plotting the core with imputation set using Cddmex (Projection Simplex), the Shapley value, pre-nucleolus, and pre-kernel.');
    CddCorePlot(v,'all',1);
    pause(5);
    disp('Plotting the core without imputation set using Cddmex (Projection Simplex), the Shapley value, pre-nucleolus, and pre-kernel.');
    CddCoreSimplexPlot(v,'all',0);
    pause(5);    
    disp('Plotting the core with imputation set using Cddmex (Projection Simplex), and the Shapley value.');
    CddCoreSimplexPlot(v,'shap',1);
    pause(5);
    disp('Plotting the core with imputation set using Cddmex (Projection Simplex), and the pre-kernel.');
    CddCoreSimplexPlot(v,'prk',1);
    pause(5);
    disp('Plotting the core with imputation set using Cddmex (Projection Simplex), and the pre-nucleolus.');
    CddCoreSimplexPlot(v,'prn',1);
    pause(5);
    disp('Plotting the core with imputation set using Cddmex (Projection Simplex).');
    CddCoreSimplexPlot(v,'none',1);
    pause(5);
    disp('Plotting the Weber set with core using Cddmex, the Shapley value, the pre-kernel, and the pre-nucleolus.');
    CddWeberSetPlot(v,'all',1);
    pause(5);
    disp('Plotting the Weber set without core using Cddmex, the Shapley value, pre-nucleolus, and pre-kernel.');
    CddWeberSetPlot(v,'all',0);
    pause(5);    
    disp('Plotting the Weber set with core using Cddmex, and the Shapley value.');
    CddWeberSetPlot(v,'shap',1);
    pause(5);
    disp('Plotting the Weber set with the core using Cddmex, and the pre-kernel.');
    CddWeberSetPlot(v,'prk',1);
    pause(5);
    disp('Plotting the Weber set with the core using Cddmex, and the pre-nucleolus.');
    CddWeberSetPlot(v,'prn',1);
    pause(5);
    disp('Plotting the Weber set with the core using Cddmex.');
    CddWeberSetPlot(v,'none',1);
    pause(5);
    disp('Plotting the Weber set with core using Cddmex (Projection Simplex), the Shapley value, the pre-kernel, and the pre-nucleolus.');
    CddWeberSetSimplexPlot(v,'all',1);
    pause(5);
    disp('Plotting the Weber set without core using Cddmex (Projection Simplex), the Shapley value, pre-nucleolus, and pre-kernel.');
    CddWeberSetSimplexPlot(v,'all',0);
    pause(5);    
    disp('Plotting the Weber set with core using Cddmex (Projection Simplex), and the Shapley value.');
    CddWeberSetSimplexPlot(v,'shap',1);
    pause(5);
    disp('Plotting the Weber set with the core using Cddmex (Projection Simplex), and the pre-kernel.');
    CddWeberSetSimplexPlot(v,'prk',1);
    pause(5);
    disp('Plotting the Weber set with the core using Cddmex (Projection Simplex), and the pre-nucleolus.');
    CddWeberSetSimplexPlot(v,'prn',1);
    pause(5);
    disp('Plotting the Weber set with the core using Cddmex (Projection Simplex).');
    CddWeberSetSimplexPlot(v,'none',1);
    pause(5);
    disp('Plotting the core cover with core using Cddmex, the Shapley value, the pre-kernel, and the pre-nucleolus.');
    CddCoreCoverPlot(v,'all',1);
    pause(5);
    disp('Plotting the core cover without core using Cddmex, the Shapley value, pre-nucleolus, and pre-kernel.');
    CddCoreCoverPlot(v,'all',0);
    pause(5);
    disp('Plotting the core cover with core using Cddmex, and the Shapley value.');
    CddCoreCoverPlot(v,'shap',1);
    pause(5);
    disp('Plotting the core cover with the core using Cddmex, and the pre-kernel.');
    CddCoreCoverPlot(v,'prk',1);
    pause(5);
    disp('Plotting the core cover with the core using Cddmex, and the pre-nucleolus.');
    CddCoreCoverPlot(v,'prn',1);
    pause(5);
    disp('Plotting the core cover with the core using Cddmex.');
    CddCoreCoverPlot(v,'none',1);
    pause(5);
    disp('Plotting the core cover with core using Cddmex (Projection Simplex), the Shapley value, the pre-kernel, and the pre-nucleolus.');
    CddCoreCoverSimplexPlot(v,'all',1);
    pause(5);
    disp('Plotting the core cover without core using Cddmex (Projection Simplex), the Shapley value, pre-nucleolus, and pre-kernel.');
    CddCoreCoverSimplexPlot(v,'all',0);
    pause(5);
    disp('Plotting the core cover with core using Cddmex (Projection Simplex), and the Shapley value.');
    CddCoreCoverSimplexPlot(v,'shap',1);
    pause(5);
    disp('Plotting the core cover with the core using Cddmex (Projection Simplex), and the pre-kernel.');
    CddCoreCoverSimplexPlot(v,'prk',1);
    pause(5);
    disp('Plotting the core cover with the core using Cddmex (Projection Simplex), and the pre-nucleolus.');
    CddCoreCoverSimplexPlot(v,'prn',1);
    pause(5);
    disp('Plotting the core cover with the core using Cddmex (Projection Simplex).');
    CddCoreCoverSimplexPlot(v,'none',1);
    pause(5);
    disp('Plotting the anti-core with the anti-imputation set, the Shapley value, anti-pre-nucleolus, and anti-pre-kernel.');
    if isunix || ismac
       AntiCorePlot(dv,'all',1);
    elseif ispc
       disp('Skipping test; not supported!');
    end	    
    pause(5);
    disp('Plotting the anti-core without the anti-imputation set, the Shapley value, anti-pre-nucleolus, and anti-pre-kernel.');
    if isunix || ismac 
      AntiCorePlot(dv,'all',0);
    elseif ispc
      disp('Skipping test; not supported!');
    end	     
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex, the Shapley value, anti-pre-nucleolus, and anti-pre-kernel.');
    CddAntiCorePlot(dv,'all',1);
    pause(5);
    disp('Plotting the anti-core without anti-imputation set using Cddmex, the Shapley value, anti-pre-nucleolus, and anti-pre-kernel.');
    CddAntiCorePlot(dv,'all',0);
    pause(5);
    disp('Plotting the anti-core without anti-imputation set, and the Shapley value.');
    if isunix || ismac
      AntiCorePlot(dv,'shap',0);
    elseif ispc
      disp('Skipping test; not supported!');
    end	     
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex, and the Shapley value.');
    CddAntiCorePlot(dv,'shap',1);
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex, and the anti-pre-kernel.');
    CddAntiCorePlot(dv,'aprk',1);
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex, and the anti-pre-nucleolus.');
    CddAntiCorePlot(dv,'aprn',1);
    pause(5);
    disp('Plotting the anti-core with the anti-imputation set using Cddmex (Projection Simplex), the Shapley value, anti-pre-nucleolus, and anti-pre-kernel.')
    CddAntiCoreSimplexPlot(dv,'all',1);
    pause(5);
    disp('Plotting the anti-core without anti-imputation set using Cddmex (Projection Simplex), the Shapley value, anti-pre-nucleolus, and anti-pre-kernel.');
    CddAntiCoreSimplexPlot(dv,'all',0);
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex (Projection Simplex), and the Shapley value.');
    CddAntiCoreSimplexPlot(dv,'shap',1);
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex (Projection Simplex), and the anti-pre-kernel.');
    CddAntiCoreSimplexPlot(dv,'aprk',1);
    pause(5);
    disp('Plotting the anti-core with anti-imputation set using Cddmex (Projection Simplex), and the anti-pre-nucleolus.');
    CddAntiCoreSimplexPlot(dv,'aprn',1);
    pause(5);
    disp('Plotting Kernel catchers upper and lower set using Cddmex, the pre-kernel/nucleolus the Shapley value.');
    CddKernelCatchers(v,'all',1);
    pause(5);
    disp('Plotting Kernel catchers upper, reasonable and lower set using Cddmex, the pre-kernel/nucleolus the Shapley value.');
    CddKernelCatchers(v,'all','1060',1);
    pause(5);
    disp('Plotting Kernel catchers upper and lower set using Cddmex (Projection Simplex), the pre-kernel/nucleolus the Shapley value.');
    CddKernelCatchersSimplex(v,'all',1);
    pause(5);
    disp('Plotting Kernel catchers upper, reasonable and lower set using Cddmex (Projection Simplex), the pre-kernel/nucleolus the Shapley value.');
    CddKernelCatchersSimplex(v,'all','1060',1);
    pause(5);
catch
   disp('http://control.ee.ethz.ch/~mpt/3/Main/Installation');
   error('MPT3 library is not installed or it is not in the Matlab path!')
end
