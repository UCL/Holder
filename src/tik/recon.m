% $$$ function recon3(Rat_number,EIT_serial)

load('/scratch/scratch/ccearal/Jacobian_hex_neonate_noskull.mat', ...
     'BV0','J');

%  load ('Data/dV');
 load('/scratch/scratch/ccearal/Combined_Matrix_New.mat')
 
   
    BV_baseline=BV_baseline.*repmat(sign(BV0),1,size(BV_baseline,2));
 BV_pert=BV_pert.*repmat(sign(BV0),1,size(BV_pert,2));
 
   dZ=1e-6*(BV_pert-BV_baseline)';
   BV=1e-6*BV_baseline(:,1);
   
  sel=keep_idx;
   
   dZ=dZ(:,sel);
   BV=BV(sel);
   %Noise=Noise(:,sel);
   Noise=3e-6*randn(500,length(BV));
   J=J(sel,:);
   BV0=BV0(sel);
 
    %%
%      figure
%      scatter(abs(BV0),BV)
%      xl=xlim; yl=ylim;
%      hold on
%      plot([0,max([xl,yl])],[0,max([xl,yl])],'-k')
%      drawnow;
    % $$$ title(sprintf('Rat %03i EIT %s',Rat_number,EIT_serial))
    % $$$ clear BV BV0
    %%

    n_T = size(dZ,1);
    n_N = size(Noise,1);
    n_J = size(J,1);

    x=dZ;
    y=Noise;

%% Cross-validated inversion

    tic
    
    %SVD
    [U,S,V] = svd(J,'econ');
    disp(sprintf('SVD done: %.2f min.',toc/60))
    
    %pick lambda searchspace
    lambda = logspace(-20,-2,500);

    %Do inversion
    [X,cv_error] = tikhonov_zero_order_CV(J,x',lambda,n_J,U,S,V);
    disp(sprintf('X done: %.2f min.',toc/60));

%% Compute correction
    UtNoise = U'*y';
    sv = diag(S);
    opt = zeros(size(cv_error,2),1);
    for i=1:size(cv_error,2)
        e = cv_error(:,i);
        f = (e(1:end-2)>=e(2:end-1))&(e(3:end)>e(2:end-1));
        if any(f)
            opt(i) = find(f,1,'last')+1;
            disp(['Check your cv_error, sample=' num2str(i)]);
        else
            [m,opt(i)] = min(e);
        end
    end

    SD = zeros(size(X));
    for i=1:size(SD,2)
        sv_i = sv+lambda(opt(i))./sv;
        SD(:,i) = std(V*(diag(1./sv_i)*UtNoise),0,2);
    % $$$     disp(num2str([i,toc/60]))
    end
    
%% Save
    Sigma=X./SD;
    save(['/scratch/scratch/ccearal/recon_nn_1500um_JENKINS.mat'],...
         'Sigma','cv_error','lambda','-v7.3');
     disp('All done motherfucker!');
