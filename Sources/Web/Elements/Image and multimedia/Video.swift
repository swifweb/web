//
//  Video.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML Video element (<video>) embeds a media player
/// which supports video playback into the document.
/// You can use <video> for audio content as well,
/// but the audio element may provide a more appropriate user experience.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
open class Video: BaseActiveElement, _AbortHandleable, _CanPlayHandleable, _CanPlayThroughHandleable, _DurationChangeHandleable, _EndedHandleable, _LoadedDataHandleable, _LoadedMetadataHandleable, _LoadStartHandleable, _PauseHandleable, _PlayHandleable, _PlayingHandleable, _ProgressHandleable, _RateChangeHandleable, _SeekedHandleable, _SeekingHandleable, _StalledHandleable, _SuspendHandleable, _TimeUpdateHandleable, _VolumeChangeHandleable, _WaitingHandleable {
    var abortClosure: AbortClosure?
    var abortHandler: (UIEvent) -> Void = { _ in }
    
    var canPlayClosure: CanPlayClosure?
    var canPlayHandler: (HandledEvent) -> Void = { _ in }
    
    var canPlayThroughClosure: CanPlayThroughClosure?
    var canPlayThroughHandler: (HandledEvent) -> Void = { _ in }
    
    var durationChangeClosure: DurationChangeClosure?
    var durationChangeHandler: (HandledEvent) -> Void = { _ in }
    
    var endedClosure: EndedClosure?
    var endedHandler: (HandledEvent) -> Void = { _ in }
    
    var loadedDataClosure: LoadedDataClosure?
    var loadedDataHandler: (HandledEvent) -> Void = { _ in }
    
    var loadedMetadataClosure: LoadedMetadataClosure?
    var loadedMetadataHandler: (HandledEvent) -> Void = { _ in }
    
    var loadStartClosure: LoadStartClosure?
    var loadStartHandler: (ProgressEvent) -> Void = { _ in }
    
    var pauseClosure: PauseClosure?
    var pauseHandler: (HandledEvent) -> Void = { _ in }
    
    var playClosure: PlayClosure?
    var playHandler: (HandledEvent) -> Void = { _ in }
    
    var playingClosure: PlayingClosure?
    var playingHandler: (HandledEvent) -> Void = { _ in }
    
    var progressClosure: ProgressClosure?
    var progressHandler: (HandledEvent) -> Void = { _ in }
    
    var rateChangeClosure: RateChangeClosure?
    var rateChangeHandler: (HandledEvent) -> Void = { _ in }
    
    var seekedClosure: SeekedClosure?
    var seekedHandler: (HandledEvent) -> Void = { _ in }
    
    var seekingClosure: SeekingClosure?
    var seekingHandler: (HandledEvent) -> Void = { _ in }
    
    var stalledClosure: StalledClosure?
    var stalledHandler: (HandledEvent) -> Void = { _ in }
    
    var suspendClosure: SuspendClosure?
    var suspendHandler: (HandledEvent) -> Void = { _ in }
    
    var timeUpdateClosure: TimeUpdateClosure?
    var timeUpdateHandler: (HandledEvent) -> Void = { _ in }
    
    var volumeChangeClosure: VolumeChangeClosure?
    var volumeChangeHandler: (HandledEvent) -> Void = { _ in }
    
    var waitingClosure: WaitingClosure?
    var waitingHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        abortClosure?.release()
        canPlayClosure?.release()
        canPlayThroughClosure?.release()
        durationChangeClosure?.release()
        endedClosure?.release()
        loadedDataClosure?.release()
        loadedMetadataClosure?.release()
        loadStartClosure?.release()
        pauseClosure?.release()
        playClosure?.release()
        playingClosure?.release()
        progressClosure?.release()
        rateChangeClosure?.release()
        seekedClosure?.release()
        seekingClosure?.release()
        stalledClosure?.release()
        suspendClosure?.release()
        timeUpdateClosure?.release()
        volumeChangeClosure?.release()
        waitingClosure?.release()
    }
}
