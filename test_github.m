try
  wnd = Screen('OpenWindow',0);
  ifi = 1/Screen('FrameRate',wnd);
  stimDuration = 10*ifi;
  %--- 'responseKeyIdx' is a vector of 4 indices into the "keyCode"-vector
  %    returned by KbWait() and friends.
  responseKeyIdx = KbName({'left','right','up','down'});
  escapeKeyIdx = KbName('esc');
  %--- Trial loop.
  for trial=1:5
    %--- Start the trial only after all keys have been released.
    KbReleaseWait();
    %--- Inter-trial pause.
    pause(1);
    %--- Draw stimulus (here, just a black square).
    Screen('FillRect', wnd, 0, [500,500,600,600]);
    stimStartTi = Screen('Flip', wnd);
    %---Clear stimulus (done automatically here).
    %--- 'stimDuration' is assumed to be small enough for key presses not to occur 
    %    before the final Screen('Flip',?) is executed (any earlier key presses will 
    %    be classified as premature response, see below). 'stimDuration' should be rounded 
    %    to an integer multiple of 'ifi' {inter-frame-interval, basically 1.0/Screen('FrameRate',wnd)}.
    %    "-ifi/2" makes timing errors less likely.
    Screen('Flip', wnd, stimStartTi+stimDuration-ifi/2);
    %--- Wait for a key with a timeout of 5 seconds.
    %    KbWait also returns if a key is already pressed. And once any key is pressed (even if it is 
    %    none of the response keys), it does return immediately, without waiting for any keys to be released.
    [responseTi, keyStateVec] = KbWait([], [], GetSecs()+5);
    %--- It is always a good idea to allow us to escape.
    if keyStateVec(escapeKeyIdx)
      error('Escape key pressed.');
    end
    %--- Here, RT is defined as the response time relative to stimulus onset.
    RT = responseTi - stimStartTi;
    responseIdx = find( keyStateVec(responseKeyIdx) );
    if RT<0.1 || isempty(responseIdx) || length(responseIdx)>1
      %--- Premature, no, or multiple keys response => invalid response.
      fprintf('Invalid response.\n');
    else
      %--- Valid response as far as the timing and the key is concerned.
      fprintf('Valid response (response=%u, RT=%u ms).\n',responseIdx, round(RT*1000));
    end
  end % next trial
  %--- Before closing the window, make sure that all keys are released, so
  %    no key presses "fall through" to the MATLAB's command window 
  %    or editor and mess things up there.
  KbReleaseWait();
  sca();   % Screen close all
catch e
  %--- An error occurred: Emergency cleanup.
  KbReleaseWait();
  sca();   % Screen close all
  rethrow(e);  
end