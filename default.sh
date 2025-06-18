#!/bin/bash

source /venv/main/bin/activate

pip install ninja

TORCH_CUDA_ARCH_LIST=12.0  /venv/main/bin/pip install -v --no-deps git+https://github.com/facebookresearch/xformers.git@main#egg=xformers
pip install huggingface_hub[hf_transfer]
pip install hf_transfer
huggingface-cli login --token $HF_TOKEN
export HF_HUB_ENABLE_HF_TRANSFER=1
pip install -U accelerate==0.32.0
COMFYUI_DIR=${WORKSPACE}/ComfyUI


huggingface-cli download Ultimatech/rosary 8StepsCreartHyperFlux_creartUltimate.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/unet/
huggingface-cli download Ultimatech/rosary rosary_flux.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/loras/

huggingface-cli download xinsir/controlnet-openpose-sdxl-1.0 diffusion_pytorch_model.safetensors --local-dir ${COMFYUI_DIR}/models/controlnet/
mv ${COMFYUI_DIR}/models/controlnet/diffusion_pytorch_model.safetensors ${COMFYUI_DIR}/models/controlnet/xinsir-ontrolnet-openpose-sdxl-1.0.safetensors


huggingface-cli download xinsir/controlnet-openpose-sdxl-1.0 diffusion_pytorch_model_twins.safetensors --local-dir ${COMFYUI_DIR}/models/controlnet/
mv ${COMFYUI_DIR}/models/controlnet/diffusion_pytorch_model_twins.safetensors ${COMFYUI_DIR}/models/controlnet/xinsir-ontrolnet-openpose-sdxl-1.0_twins.safetensors



huggingface-cli download xinsir/controlnet-depth-sdxl-1.0 diffusion_pytorch_model.safetensors --local-dir ${COMFYUI_DIR}/models/controlnet/
mv ${COMFYUI_DIR}/models/controlnet/diffusion_pytorch_model.safetensors ${COMFYUI_DIR}/models/controlnet/controlnet-depth-sdxl-1.0.safetensors


huggingface-cli download Comfy-Org/flux1-dev flux1-dev-fp8.safetensors --local-dir ${COMFYUI_DIR}/models/unet/


huggingface-cli download comfyanonymous/flux_text_encoders --local-dir ${COMFYUI_DIR}/models/clip/


huggingface-cli download Kijai/DepthAnythingV2-safetensors --local-dir ${COMFYUI_DIR}/models/depthanything


huggingface-cli download black-forest-labs/FLUX.1-Redux-dev flux1-redux-dev.safetensors --local-dir ${COMFYUI_DIR}/models/style_models/

huggingface-cli download black-forest-labs/FLUX.1-schnell ae.safetensors --local-dir ${COMFYUI_DIR}/models/vae/



huggingface-cli download h94/IP-Adapter --local-dir ${COMFYUI_DIR}/models/ipadapter/

huggingface-cli download h94/IP-Adapter-FaceID --local-dir ${COMFYUI_DIR}/models/ipadapter/

cp ${COMFYUI_DIR}/models/ipadapter/ip-adapter-faceid_sd15_lora.safetensors ${COMFYUI_DIR}/models/loras/
cp ${COMFYUI_DIR}/models/ipadapter/ip-adapter-faceid-plusv2_sd15_lora.safetensors ${COMFYUI_DIR}/models/loras/
cp ${COMFYUI_DIR}/models/ipadapter/ip-adapter-faceid_sdxl_lora.safetensors ${COMFYUI_DIR}/models/loras/
cp ${COMFYUI_DIR}/models/ipadapter/ip-adapter-faceid-plusv2_sdxl_lora.safetensors ${COMFYUI_DIR}/models/loras/
cp ${COMFYUI_DIR}/models/ipadapter/ip-adapter-faceid-plus_sd15_lora.safetensors ${COMFYUI_DIR}/models/loras/


huggingface-cli download laion/CLIP-ViT-H-14-laion2B-s32B-b79K model.safetensors --local-dir ${COMFYUI_DIR}/models/clip_vision/

mv ${COMFYUI_DIR}/models/clip_vision/model.safetensors ${COMFYUI_DIR}/models/clip_vision/CLIP-ViT-H-14-laion2B-s32B-b79K.safetensors

#CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors is inside  /workspace/ComfyUI/models/ipadapter/sdxl_models/image_encoder/model.safetensors

cp ComfyUI/models/ipadapter/sdxl_models/image_encoder/model.safetensors ComfyUI/models/clip_vision/
mv ${COMFYUI_DIR}/models/clip_vision/model.safetensors ${COMFYUI_DIR}/models/clip_vision/CLIP-ViT-bigG-14-laion2B-39B-b160k.safetensors

huggingface-cli download HCMUE-Research/SAM-vit-h sam_vit_h_4b8939.pth --local-dir ${COMFYUI_DIR}/models/sams/

huggingface-cli download techparasite/necklace IC_TRY_ON_v3_e4.safetensors --local-dir ${COMFYUI_DIR}/models/loras/

huggingface-cli download techparasite/necklace sigclip_vision_patch14_384.safetensors --local-dir ${COMFYUI_DIR}/models/clip_vision/

huggingface-cli download techparasite/necklace XL_Apex_XL_v4.safetensors --local-dir ${COMFYUI_DIR}/models/checkpoints/


huggingface-cli download techparasite/necklace vitmatte-20250323T105902Z-001.zip --local-dir ${COMFYUI_DIR}/models/vitmatte/
unzip ${COMFYUI_DIR}/models/vitmatte/vitmatte-20250323T105902Z-001.zip -d ${COMFYUI_DIR}/models/vitmatte/
huggingface-cli download techparasite/necklace segmentation_mask_brushnet_ckpt_sdxl_v0-20240907T113638Z-001-20250323T105307Z-001.zip --local-dir ${COMFYUI_DIR}/models/inpaint/
unzip ${COMFYUI_DIR}/models/inpaint/segmentation_mask_brushnet_ckpt_sdxl_v0-20240907T113638Z-001-20250323T105307Z-001.zip -d ${COMFYUI_DIR}/models/inpaint/


huggingface-cli download techparasite/necklace XL_Apex_XL_v4.safetensors --local-dir ${COMFYUI_DIR}/models/checkpoints/




huggingface-cli download Kijai/WanVideo_comfy Wan2_1-I2V-14B-720P_fp8_e4m3fn.safetensors --local-dir ${COMFYUI_DIR}/models/unet/
huggingface-cli download Kijai/WanVideo_comfy Wan2_1_VAE_fp32.safetensors --local-dir ${COMFYUI_DIR}/models/vae/


huggingface-cli download Kijai/WanVideo_comfy Wan2_1_VAE_bf16.safetensors --local-dir ${COMFYUI_DIR}/models/vae/
huggingface-cli download Kijai/WanVideo_comfy open-clip-xlm-roberta-large-vit-huge-14_visual_fp16.safetensors --local-dir ${COMFYUI_DIR}/models/clip/

huggingface-cli download Kijai/WanVideo_comfy umt5-xxl-enc-bf16.safetensors --local-dir ${COMFYUI_DIR}/models/clip/


huggingface-cli download gemasai/4x_NMKD-Siax_200k --local-dir ${COMFYUI_DIR}/models/upscale_models/

huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/text_encoders/umt5_xxl_fp8_e4m3fn_scaled.safetensors --local-dir ${COMFYUI_DIR}/models/clip/

huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/clip_vision/clip_vision_h.safetensors --local-dir ${COMFYUI_DIR}/models/clip_vision/

huggingface-cli download Comfy-Org/Wan_2.1_ComfyUI_repackaged split_files/vae/wan_2.1_vae.safetensors --local-dir ${COMFYUI_DIR}/models/vae/




huggingface-cli download jasperai/LBM_relighting model.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/diffusion_models/
huggingface-cli download ViperYX/BiRefNet --local-dir ${COMFYUI_DIR}/models/BiRefNet/

huggingface-cli download Ultimatech/rosary rosary_xl-000008.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/loras/
huggingface-cli download Ultimatech/rosary "ACE++ Subject图案迁移.safetensors"  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/loras/
huggingface-cli download Ultimatech/rosary "【摸鱼】商业写实渲染 _ 电商产品场景 _V1.safetensors"  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/loras/

huggingface-cli download Ultimatech/rosary "真境写真XL Elite KV _ 电商产品摄影海报视觉设计_VisionX Elite.safetensors"  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/checkpoints/
huggingface-cli download Ultimatech/rosary flex1_redux_siglip2_512.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/style_models/
huggingface-cli download Ultimatech/rosary siglip2_so400m_patch16_512.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/clip_vision/

huggingface-cli download Ultimatech/rosary xinsir_controlnet-canny-sdxl-1.0_v2.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/controlnet/
huggingface-cli download Ultimatech/rosary flux-controlnet-canny.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/controlnet/
huggingface-cli download Ultimatech/rosary xinsir_controlnet-depth-sdxl-1.0.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/controlnet/
huggingface-cli download Ultimatech/rosary segmentation_mask_brushnet_ckpt_sdxl_v1-20250329T134055Z-001/segmentation_mask_brushnet_ckpt_sdxl_v1/diffusion_pytorch_model.safetensors  --repo-type dataset --local-dir ${COMFYUI_DIR}/models/inpaint/

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/chflame163/ComfyUI_LayerStyle"
    "https://github.com/storyicon/comfyui_segment_anything"
    "https://github.com/nullquant/ComfyUI-BrushNet"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/kijai/ComfyUI-Florence2"
    "https://github.com/kijai/ComfyUI-IC-Light"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/lrzjason/Comfyui-In-Context-Lora-Utils"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/MixLabPro/comfyui-mixlab-nodes"
    "https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92"
    "https://github.com/kijai/ComfyUI-segment-anything-2"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
    "https://github.com/mingsky-ai/ComfyUI-MingNodes"
    "https://github.com/kijai/ComfyUI-LBMWrapper"
    "https://github.com/logtd/ComfyUI-Fluxtapoz"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/chflame163/ComfyUI_LayerStyle_Advance"
    "https://github.com/siliconflow/BizyAir"    
)

WORKFLOWS=(

)

CHECKPOINT_MODELS=(
    "https://civitai.com/api/download/models/798204?type=Model&format=SafeTensor&size=full&fp=fp16"
)

UNET_MODELS=(
)

LORA_MODELS=(
)

VAE_MODELS=(
)

ESRGAN_MODELS=(
)

CONTROLNET_MODELS=(
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi

pip install -U accelerate
