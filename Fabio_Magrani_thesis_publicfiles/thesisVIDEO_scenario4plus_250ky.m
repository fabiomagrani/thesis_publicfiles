%% IMAGES FOR VIDEO 250ky ODs development

%Each time step corresponds to 250y
SPM=SPMload; SPM.mesh; nx=SPM.mesh.nx;
ny=SPM.mesh.ny; 

%create varables and "long" erosion - scenario 4 multiplied by 10
for i=1:1:100
    clf
    
    array=1:1:100; 
    stringarray=cellstr(string(array)); %create array for variable names
    
    Varnames{i} = matlab.lang.makeValidName(strcat('step',stringarray{i}));
   
    fnr=i;loaddata; %loads spm data for specific time (i)
    
    erosionC4_250ky.(Varnames{i}) = (10.*(abrasion+quarrying));
    
    
    %DO and save image
    erosionC4_250ky_step=erosionC4_250ky.(Varnames{i});
    erosionC4_250ky_step(erosionC4_250ky_step==0)=NaN; %remove zero erosion
    
    surf(log10(erosionC4_250ky_step));shading interp;crameri vik;
    yticks([0 50 100 150 200]);xticks([0 50 100 150 200]);
    xtix = get(gca, 'XTick'); set(gca, 'XTick',xtix,'XTickLabel',xtix./2);
    ytix = get(gca, 'YTick'); set(gca, 'YTick',ytix,'YTickLabel',ytix./2);
    xlabel('Distance (Km)');ylabel('Distance (Km)');colorbar
    
    caxis([0 3]); xlim([0 226]);ylim([0 206])
    view([0 -90])
    
    saveas(gcf,sprintf('FIG%d.tif',i));
    
end


 