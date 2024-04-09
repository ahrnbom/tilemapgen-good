from invoke import task, Context

PROJECT_NAME="default_project"

@task
def install(c: Context):
    """
    Installs the package. You typically do not need to run this manually.
    """
    c.run("pip install -e .")

@task(install)
def swatch(c: Context, prompt:str, name=PROJECT_NAME, negative_prompt:str="", seed:int=-1, num_inference_steps:int=-1, guidance_scale:float=-1, num_images:int=1):
    """
    Generates textures based on prompt. You typically run this first.
    """
    neg_promt_str = ""
    if negative_prompt:
        neg_promt_str = f"--negative_prompt '{negative_prompt}"

    seed_str = ""
    if seed >= 0:
        seed_str = f"--seed {seed}"

    num_inf_str = ""
    if num_inference_steps >= 1:
        num_inf_str = f"--num_inference_steps {num_inference_steps}"

    guide_str = ""
    if guidance_scale > 0:
        guide_str = f"--guidance_scale {guidance_scale:.5f}"

    c.run(f"tilemapgen swatch --parent_path /mounted --name {name} --prompt '{prompt}' --num_images {num_images} {neg_promt_str} {seed_str} {num_inf_str} {guide_str}")
