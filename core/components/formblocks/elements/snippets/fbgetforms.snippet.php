<?php
$contextKey = $modx->resource->get('context_key');
if($contextKey) {
    $context = $modx->getContext($contextKey);
    if($context) {
        $parentID = $context->getOption('formblocks.container_id');
    }
}
if(!$parentID) {
    $parentID = $modx->getOption('formblocks.container_id');
}

$output = $modx->runSnippet('getResources', (array(
    'parents' => $parentID,
    'limit' => 99,
    'showHidden' => 1,
    'showUnpublished' => 1,
    'tpl' => '@INLINE [[+pagetitle]]=[[+id]]'
    )
));

return $output;
